Return-Path: <linux-clk+bounces-13030-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D39769982DA
	for <lists+linux-clk@lfdr.de>; Thu, 10 Oct 2024 11:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6662CB22739
	for <lists+linux-clk@lfdr.de>; Thu, 10 Oct 2024 09:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFD81BD4F7;
	Thu, 10 Oct 2024 09:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rP4ng+oP"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A511BBBEB
	for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 09:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553979; cv=none; b=XeyZJPdsbtkA6LmtdrYR3yFnT/Ka337Sqi6Jq0y8YiqHcl+wN9opRhEYbeI3wDwMWUdCtl2VjbvpKn4JlPzlw/Abgg2BNqKVZsM4VK+LU8//xBcFBnVuzON/QI0w5SM8srrXmDZAOowTx+nZzLng/x/rj3PDlEKyqK+X6i47+oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553979; c=relaxed/simple;
	bh=aR/od7u1Dm0L0Askk5LTo4Dg9qcC5Z7NUkiE7B1SAOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aog8qwAH+mgC4YYWix8SOjSexcJsX/NrhcyyTo+D4ZW/hfihYC/PJcbUkHN9llNgMUDxrZNOW08647USDGh96jUisFn2hX7nONJRFzp6coY7Ze8vzn6d5QCqu3mh8Hs1BfeHZfB+qrECdsZcEgTePohzJMyFQHWd6sByyZVQ2qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rP4ng+oP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a99422c796eso119452066b.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 02:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1728553975; x=1729158775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=40jcWFUFi0Oxb77A5Qmw+6hx6Ee/l4XlcgBsvUfMoMI=;
        b=rP4ng+oPD0u2B3qdAe5EpJ170oqHVt1uypV1gQHuBQ1/fFwUFGbBYAoH4VigrbhvZ4
         b/MKz6LyoIAljMDhRiCOeD07Jkn7a31nFuX5dIQcxDZeBksgtU7Vg8XaR0jfg0nRA03Y
         aScZr+q+/gsziN9ljcKmgvei1BITqKtoE/giM6xY8uEnwpSWvASmxytf5AOs9A6qL4/O
         PcB9tOTVbNSAaug0/yEk5nTF1iq7XdF/lHl2F1Qeg7bXqmOAvITKeDR5wzxc2GdD023W
         kswsTvCFPCTlDavbtTLHUOivKp1MQqTZbNLj034oW34GBE4fWFmA6yi/pJZMGW91lkt5
         acTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553975; x=1729158775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=40jcWFUFi0Oxb77A5Qmw+6hx6Ee/l4XlcgBsvUfMoMI=;
        b=B6SgtjFFNz//qDIPW7cFX8e31OYHp558uOlnXrp51W/+R41bJqcPWPto6RNzgCxDfl
         A6aZqt8qXFHFhz+ellPhT1E6CqBVTEeYdK/ebrSibtZzXdH+6+VSOEoHg6NArCqTbtrU
         1YPliX1jCqFtRP76kMfSJdAGE+QaQqt9rv//269ydAAo83g9KfKvmiljigStpMoEdPNN
         uTyZEiTH5ylxM0GcUR/v1JBy9WySO0tSFtIOyDVIN6JAxDPKCaVn8qB0H0euNgwbIuOE
         mqlCuzIUfnERNMgKHp6tboFwVzUphhyWemcyzfmivYmz0Cb5tdYJUeIs3O2Av/Yx5fSA
         LqGA==
X-Forwarded-Encrypted: i=1; AJvYcCWlk653hoOdBuQ34Pv4wZLCyUqJGSOQQ7vBOB3rli0m3jt00xCQlkP0YwA0Vz0xaQNd2J6WPAGRO7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhL/A0ANy73CPK+My+27ly6XvBiqRZfRh7SQSkPyOHCc85OeeD
	WbDSUeUnTEopfP6nW/3JhFxzJ14L81lNONuNParMPGd4wa3mMyoXYt8Tl53L4ss=
X-Google-Smtp-Source: AGHT+IHGpgFAaHxId5Yu05QYCpBK0KheH6IwCDZNQtW0JlFbclcqU+qgTj7MahEzfh9iuoNu+rHtpQ==
X-Received: by 2002:a17:907:1c8c:b0:a99:4698:cc5a with SMTP id a640c23a62f3a-a999e8ca4e9mr286372166b.47.1728553974406;
        Thu, 10 Oct 2024 02:52:54 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80dc524sm65297566b.148.2024.10.10.02.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 02:52:53 -0700 (PDT)
Message-ID: <1c733190-bd46-43d0-8f3d-62e0ed5fde42@tuxon.dev>
Date: Thu, 10 Oct 2024 12:52:52 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document
 the Renesas RTCA-3 IP
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com,
 magnus.damm@gmail.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-6-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWeGC_N3-XF29+UUR43OGJKqVNNHs042J8HRuNpiD=vOg@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWeGC_N3-XF29+UUR43OGJKqVNNHs042J8HRuNpiD=vOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 10.10.2024 12:29, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, Aug 30, 2024 at 3:02 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
>> The RTC IP available on Renesas RZ/V2H is almost identical with the
>> one found on Renesas RZ/G3S (it misses the time capture functionality
>> which is not yet implemented on proposed driver). For this, added also a
>> generic compatible that will be used at the moment as fallback for both
>> RZ/G3S and RZ/V2H.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - added RTC bus clock, reset and power-domain; it has been detected
>>   by reverse engineering that RTC and VBATTB clock, reset and power
>>   domain are shared; HW manual doesn't mention it
>> - updated example with these and with assigned-clock properties
>>   needed to configure the VBATTCLK MUX with proper parent
>> - updated example section with dt-bindings/clock/r9a08g045-cpg.h
>>   and dt-bindings/clock/r9a08g045-vbattb.h includes
>> - for all these, dropped Conor's Rb tag
> 
> Thanks for the update!
> 
> Sorry for chiming in late, but this RTCA-3 block seems to be a
> derivative of the RTC blocks found on older SuperH SoCs, and on RZ/A1
> and RZ/A2 ARM SoCs.  Differences are found in (lack of)
> 100/1000-year-count parts and the Year Alarm Enable Register, and in
> some control register bits.

At a 1st look it seems so, yes. I was inclined at the beginning to just use
the rtc-sh but the RZ/G3S HW manual mentions a lot of restrictions that
need to be followed when configuring the IP. Because of these restrictions
I chose to have a different driver. Otherwise the rtc-sh would have become
way too complication as far as I can tell.

From these restriction I can mention:
- wait for 2*1/64 periods when configuring the alarm
- from HW manual: When the RCR1 register is modified,
 check that all the
  bits have been updated before proceeding to the next processing
- from HW manual: section 22.6.4. Notes on writing to and
  reading from registers) after writing to count registers, alarm
  registers, year alarm enable register, bits RCR2.AADJE, AADJP,
  and HR24 register, we need to do 3 empty reads before being
  able to fetch the registers content.
- updates to RCR2.START need to be checked before continuing (note 2 from
  HW manual on RCR2 register: After writing to this bit, confirm that its
  value has actually changed before proceeding with further processing)
- there are many bits that are synchronized w/ count source and need to be
  checked before proceeding (when setting it up).
- According to HW manual (section 22.4.2. Clock and count mode setting
  procedure) we need to wait at least 6 cycles of the 32KHz clock after
  clock was enabled.
- According to HW manual (section 22.3.19. RTC Control
  Register 2) when set 24 hours mode this needs to be done separate from
  stop operation.
- According to HW manual (section 22.6.3. Notes on writing to and reading
  from registers) after reset we need to wait 6 clock cycles before
  writing to RTC registers.
- According to HW manual (section 22.6.4. Notes on writing to and reading
  from registers) we need to wait 1/128 seconds while the clock is
  operating (RCR2.START bit = 1) to be able to read the counters after a
  return from reset.
- and there are other restrictions

Thank you,
Claudiu Beznea

> 
> The SuperH and RZ/A1 variant is supported by drivers/rtc/rtc-sh.c;
> DT bindings for the latter are found in
> Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml.
> 
> (My first guess was that RTC-A1 is used on RZ/A1, RTC-A2 on RZ/A2,
>  and RTC-A3 on RZ/A3, but apparently RZ/A3UL does not have an RTC...
>  Oh well, at least it is used on later RZ series SoCs...)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


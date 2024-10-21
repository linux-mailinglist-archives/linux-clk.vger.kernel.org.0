Return-Path: <linux-clk+bounces-13457-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 880819A5D7F
	for <lists+linux-clk@lfdr.de>; Mon, 21 Oct 2024 09:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 324001F21869
	for <lists+linux-clk@lfdr.de>; Mon, 21 Oct 2024 07:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AFB1E0E0A;
	Mon, 21 Oct 2024 07:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rMZ/x6z0"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD11E0DF3
	for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 07:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496947; cv=none; b=fNmhCGlUzRp9ppjMqanFSlUdIdXyGPA3r7GjCE6V0F9iqAZxV726PRVi7l0d1b2sSfFa2J2zInasT4h+wWMhxyEHO1WbIDarFkQIVx5QOFrPJBmpowi6QcgdQKie7Ay5vtESsahgciwQB9fEVWBlQD4A94V3PCIE6GYqfOSAmDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496947; c=relaxed/simple;
	bh=rffjgAP5ZW88uPUrtaJRFYw7UB1XrEHtwZdvD7+yIv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWOokqX5idmZLNkzxFzkd02MJCKgiVswqfAEdCws2XcDdgPFuaLZszK0+P4g6hMVBK1zok84R5aSNqWUz9Ac/FOkmTZik99SloXerCR5ZjPYY7Glpel35rt9fCjtpFRm1EHdgysYNTFfVzmnK+VLo1cilOUbGNdZDJkl3qiQAs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rMZ/x6z0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315abed18aso37852465e9.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 00:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729496944; x=1730101744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58kG6E9taHK6TTsZfdidB/P2/Hcxp/vWM653t/Aj+tg=;
        b=rMZ/x6z0IHP1GC/SL4MpNjxOJUV4hJ9+9U1c6iA8pmJFsTVjhsxiM5DBzWJwvykaU0
         05GABRaIudHCFZ81wDK4zInJ7hGJ8l8DXmlrPyD/za6YLufEYtTypMS39M09KfE9/9ch
         u65GYXAPs58zK3RmT9TT7Jblbz921ViSyh7BuqtylYHtPUeFneJwq1OYUU2EDi/41rX2
         dC5Uu//X0b7EyX8YjfVvn/fJLVcM5nOg03D5vmmhNe1OksDouIsEitzrZuEGxS0cxsNJ
         SBB5BTU+Fso0ZdUppH4RNDc0yi87J5w2LLbXH/vUhEE6xRJwkV0wUU/zF503I3hxT80p
         8dkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729496944; x=1730101744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58kG6E9taHK6TTsZfdidB/P2/Hcxp/vWM653t/Aj+tg=;
        b=Ke4R4Kis0g+jLSWNURFGI26qNr40aXmmKzWq/yLQboswZDjhguO6RpD/7z06nGSsIz
         ighaD13VQIgoPvDatrVyW/e28N/6/W+K6+GKA4nhtxkB6zLuuY9B0LnztjmBxEOOUDjz
         T2xmEg50BFwnosEXkNmluXWaRrY7QDvnZxLB/duCr7fAGbHY6o4KTj7MWioVIyCzjoZq
         c1kNOEOEY3o1Pt46OkNRF+GVvjFOEcYhR9K3LqYKkSM/leV5lausvuM7MLjbMtg57qv8
         TA4K3POz+DNECIFFTgrRllalR9HHJLsEiZK5Mygtf4LRaYvUVjkyOunh+0Z2DbMLiMnb
         01MA==
X-Forwarded-Encrypted: i=1; AJvYcCX7LFm4hd71nUgytJeHMqctT+cNi8hy7td7MVHXrQNL9UJoBFxf+ljK2PGMOyRIyAAA54Z24il/cvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZbhzNxCu8TrMUZIl5Eeefq1LzrBFU/o8EKirq335njeiWmAcq
	1OhB0rTRJ2Cy4mZfdgZ/XPRlZlVU5ok7dsOHYH7v6xMO5oHqMhj/Nvq+NY56qGA=
X-Google-Smtp-Source: AGHT+IFvgo6qt2vB4D+5CxWmwBneFTMm7VvkmB3DADmGjcvJnOJUVQG58Cd4uUg0J+6QI23+xFjXxA==
X-Received: by 2002:a05:600c:4595:b0:431:3b53:105e with SMTP id 5b1f17b1804b1-4316163bccfmr91296875e9.9.1729496943898;
        Mon, 21 Oct 2024 00:49:03 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cc921sm47137075e9.46.2024.10.21.00.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 00:49:02 -0700 (PDT)
Message-ID: <ac5a6f77-cd71-4e79-973e-8ee00cd762ff@tuxon.dev>
Date: Mon, 21 Oct 2024 10:49:01 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
 <20241019084738.3370489-4-claudiu.beznea.uj@bp.renesas.com>
 <m4kxv7cba6qd67ahhh4cal6sgieohgow6f3tdvqoxvheemtp4j@gpxbkxd3tvat>
 <5fddjnvzu2e74rtmqw6o2w5upxn6dpih3hmdbgiky75qyuvyum@ilch2rahnmih>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <5fddjnvzu2e74rtmqw6o2w5upxn6dpih3hmdbgiky75qyuvyum@ilch2rahnmih>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.10.2024 10:34, Krzysztof Kozlowski wrote:
> On Mon, Oct 21, 2024 at 09:32:37AM +0200, Krzysztof Kozlowski wrote:
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>>> +    #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +
>>> +    clock-controller@1005c000 {
>>> +        compatible = "renesas,r9a08g045-vbattb";
>>> +        reg = <0x1005c000 0x1000>;
>>> +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
>>> +        clock-names = "bclk", "rtx";
>>> +        assigned-clocks = <&vbattb VBATTB_MUX>;
>>> +        assigned-clock-parents = <&vbattb VBATTB_XC>;
>>
>> Why are you configuring internal clocks to internal parents? That's part
>> internal to this device, not DTS... or at least some explanation would
>> be useful.
> 
> From DTS I see this belongs to the board, not SoC, so makes sense.

That's true. This configuration depends on the type of the input clock
connected to the RTXIN, RTXOUT pins which is board specific (see below
diagram):

           +----------+ XC   `\
RTXIN  --->|          |----->| \       +----+  VBATTCLK
           | 32K clock|      |  |----->|gate|----------->
	   | osc      | XBYP |  |      +----+
RTXOUT --->|          |----->| /
           +----------+      ,/

Thank you,
Claudiu Beznea

> 
> Best regards,
> Krzysztof
> 


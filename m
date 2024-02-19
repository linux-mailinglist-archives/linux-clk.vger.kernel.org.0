Return-Path: <linux-clk+bounces-3769-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0FB859E2C
	for <lists+linux-clk@lfdr.de>; Mon, 19 Feb 2024 09:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC5D71C219AE
	for <lists+linux-clk@lfdr.de>; Mon, 19 Feb 2024 08:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747CF21112;
	Mon, 19 Feb 2024 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VG2RGTKa"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E462110B
	for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708331157; cv=none; b=fVoMs5Ariv+1V0hkiM6vEL5cN4VeT0PrTXPVGGWMspCSmZbWzN+bRKxHzL0LBHMZx4tauYtfQvBKrR0NjEDddaN20ARDu5tlqXrh+IQ5EVIQFsWbwBnxWCPXTgffDOsjDIq28fbu2qOinxL88NCACU+Ur768v9ngGi4NGOKDcGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708331157; c=relaxed/simple;
	bh=Bo5S8xr0Ve5PB6xmg+OHUlU5Qpa2kehTBcF2IBBqPM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEvzTofWKb2JwuHXV72oqa/Rq/httzl9urXUPiw/OrUfKlMyLoTmvv14CQKz5TUsOdnya+G1d+hYTUomCMIflxV8M0gV8BcZq+y8pTCnA9efsyBY5xpSM3AA5Abpk8bPzvg1j76P9i+COcMU8CZ5UDbKuwwXotW3TIgdZ8edOgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VG2RGTKa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41241f64c6bso20365035e9.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 00:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708331154; x=1708935954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=THU6glyGzZOjGWrBiKmvVasWAwiX7vB5lqswuej4FLE=;
        b=VG2RGTKag/UlPuTV3qj04CJIbYfZ//y/RdY+Eka01J+XqP4XA7zdp7IEtnuzi9LYQZ
         N7J4jb0HpNZiWuutrqH10MY7q07/ki0VwrQU3eDA8xoIQdpwYxTaNmW8sFJ9xSuKHCK+
         k5mUxuKcnxhbkTTPTyMV4hKSGpO/V+3pVc2i/n9XlC9IytLPZSd4ZctIPiWZtdI1Paqb
         bE0oCsuORhMJNbvxx1wtiZH7qeRGdyrkGmCToXtWIUk+5OkqolYFC7PC8DkPauLpdQYC
         z0KLrW4QL+ZA3we1lLxUyExuZFTCjHiBUPwzFQD10gfe/CiLP2CveVvjLsZhrYf/Jlax
         JdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331154; x=1708935954;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THU6glyGzZOjGWrBiKmvVasWAwiX7vB5lqswuej4FLE=;
        b=Xq87W3Z7vgnBskrnO24FLcpnzOZIFhuWIhTdobnG2o/kg1b51EPuTpOX0HADx7wk+5
         wiTa9oMD1zo8fffBVNMZZUvXdjvtlkfbK/k5uWfJ9SGjO+CspG0797C42U5jO3PrOb4f
         Ixq/OLziOBiX/NHxcYsOUHdEd4b8nzbrLvxklO+nUIqJb/B8FAHgddGgkBUgVXjIQyXz
         TgPsDAq7WcCv8QYJ+qHAA5KfzUm6iav+1BUzsRd9yudx0CqVGondby0I6pRCd9gK604f
         C2WcQkuB4YwVp1pIvbdnnyi/9fLI7uxkzhZkeICVQNFh1v2I+mFnugz2rTvr6+hIiYoi
         gWrA==
X-Forwarded-Encrypted: i=1; AJvYcCVe3oVa97ZK79SmHw2dHe/KQePR6Fve5VMTja1uv2YeZGlXVu80qzNs2hPMTWk/u9JR1oOrDh3KtaEk0LyTSJOxLfD4pua6hv2n
X-Gm-Message-State: AOJu0YwxAgcA2x8lr7W/X33dOSAMtu91jIjYZZONdFY1Hx32/3qz1rTH
	SvE556z8wdtPezgmuKhwCWalFwq/BiEnUnL5K4sv67qkJE7ZsQRFWIro1mqLtMQ=
X-Google-Smtp-Source: AGHT+IF9L/CaymxUFdiz527jMYT6eakK5vqvOw31jhwzGW9Ykq8Lf7BMYyEPxr5CsmTss8mE4dWNgQ==
X-Received: by 2002:a05:600c:4f83:b0:411:fbfa:959f with SMTP id n3-20020a05600c4f8300b00411fbfa959fmr8412572wmq.27.1708331154076;
        Mon, 19 Feb 2024 00:25:54 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id l14-20020a7bc44e000000b00411d1ce4f9dsm10468796wmi.34.2024.02.19.00.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:25:53 -0800 (PST)
Message-ID: <a71a36fe-d70f-46a4-85fd-edd07c7a5bcb@tuxon.dev>
Date: Mon, 19 Feb 2024 10:25:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] clk: renesas: r9a07g043: Add initial support for
 power domains
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-9-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdV=qpVCokRW1vGDS3_ZF3RE0nVcNi9URXMNS6bUtxqTZA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdV=qpVCokRW1vGDS3_ZF3RE0nVcNi9URXMNS6bUtxqTZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16.02.2024 16:09, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Feb 8, 2024 at 1:44 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Instantiate always-on power domain for R9A07G043 SoC. At the moment, all
>> the IPs are part of this domain.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
> As not all IPs are part of the always-on domain, I'd rather defer this
> until all domains are handled in the driver.

ok

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


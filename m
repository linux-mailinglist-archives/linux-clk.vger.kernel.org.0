Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 434613DE749
	for <lists+linux-clk@lfdr.de>; Tue,  3 Aug 2021 09:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbhHCHiE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 3 Aug 2021 03:38:04 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:54052
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234148AbhHCHiC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Aug 2021 03:38:02 -0400
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 40F243F34C
        for <linux-clk@vger.kernel.org>; Tue,  3 Aug 2021 07:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627976271;
        bh=HMiKxFSYa20UfSETkthFhrIjVbst/OK+au8qKZgzUks=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=tZPpox8+0BquNgSZ6ecGhH7CeD6Gfbvs8fSbHlXERoCPYAgrhBx0xV+eqLRUCk7dd
         4s0XBWSKA3EWT4F6raOkB/wPlEJCAIVKHN9iJeN4YluKq5kil8flQDBO4IUOUQeApJ
         dKtNloUtPxbD7QsOyvmdXXY3ZnGGRa0uhKLdiws/JRty/qpemQqor8EMDDhp78xFNC
         SDsVuB0FCthYlZS6/+NEIFInmL/GlRaZu7xpGzkIw0569HElsijNyAThfKZEZC0y1V
         SVMP1i0bkrAhPMAa0O+AY+r4rOsbYaTl2yaoEnYocmFw85Txf7sNnm27gJ8IgGlwSW
         nWrvRf1uMKOHQ==
Received: by mail-ej1-f71.google.com with SMTP id gg1-20020a170906e281b029053d0856c4cdso5647589ejb.15
        for <linux-clk@vger.kernel.org>; Tue, 03 Aug 2021 00:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HMiKxFSYa20UfSETkthFhrIjVbst/OK+au8qKZgzUks=;
        b=g9Ei5DSRMtbfuXqzJdxzWeU7ASCzl4CBsLu9EpkvMHRvOU0AsdKs5Ny5hBWqqowHhX
         s0XpuNCHJdbS+bizjjeSq5QxDBVYLc+fLDjw7SIVgHPKdH/c1EX5EtaEXr7MgRjl2Q/s
         c6xzASDwP658PS7dzlzmMOZk1sD1WkXzSAtuj/jo405VY4rmyrCsYFnGwBQDFOPZh1sZ
         LCzkbtgw5IgWJ9p9t9xxzsllU9EWOjeFVE8Hk47dx+rMsgWvUhxXOgStDS19sci/HgXG
         k1rupqltOdLWfx8w/LCG65UdXUrmUsDm5/yBK0kOGJ92zm0xhC9mWilYeOrw+lhuwvHH
         pVXA==
X-Gm-Message-State: AOAM5302CAOVClPHh9gDnZun+WkxhHpZEdwG964UWaPx3z6Y8GzW11I8
        hN2/QBcGTksDjGPiWOt+aRhwx2sHHT/v2HpdwO2PLCK0i1lHpT4g862rgGc2GWhuDyBQNw5Mbed
        EzYL5s2mAfVrs6Ruh1a9fquHrwzC9+N6tHTgMzg==
X-Received: by 2002:a17:906:350c:: with SMTP id r12mr19518846eja.44.1627976270905;
        Tue, 03 Aug 2021 00:37:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyFBe5dbNxwlXlBXERsGZZkwqR37lHAwmEzaRMwA5uBHV4D/DUtM//HZhRsSt8v4oHJ3em0g==
X-Received: by 2002:a17:906:350c:: with SMTP id r12mr19518821eja.44.1627976270751;
        Tue, 03 Aug 2021 00:37:50 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id fi23sm4651493ejc.83.2021.08.03.00.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Aug 2021 00:37:49 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-5-semen.protsenko@linaro.org>
 <a1701931-136e-235c-8392-a3f64c050d74@canonical.com>
 <CAPLW+4mMCzzyqqJTse-UEpjQoVu1b-9Xz3_3L=nmg63uKYFnGw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 04/12] tty: serial: samsung: Init USI to keep clocks
 running
Message-ID: <7364ccb2-70da-6400-ae6d-6a30171b6678@canonical.com>
Date:   Tue, 3 Aug 2021 09:37:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4mMCzzyqqJTse-UEpjQoVu1b-9Xz3_3L=nmg63uKYFnGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/08/2021 01:06, Sam Protsenko wrote:

(...)

>>> diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
>>> index f6c3323fc4c5..013c2646863e 100644
>>> --- a/include/linux/serial_s3c.h
>>> +++ b/include/linux/serial_s3c.h
>>> @@ -28,6 +28,15 @@
>>>  #define S3C2410_UFSTAT         (0x18)
>>>  #define S3C2410_UMSTAT         (0x1C)
>>>
>>> +/* USI Control Register offset */
>>> +#define USI_CON                      (0xC4)
>>> +/* USI Option Register offset */
>>> +#define USI_OPTION           (0xC8)
>>> +/* USI_CON[0] = 0b0: clear USI global software reset (Active High) */
>>> +#define USI_RESET            (0<<0)
>>
>> Just 0x0. I understand you wanted to hint it is a bit field, but the
>> shift of 0 actually creates more questions.
>>
> 
> After some consideration I decided to adhere to existing style and do
> something like this (in v2):
> 
> 8<--------------------------------------------------------------------->8
> #define USI_CON          (0xC4)
> #define USI_OPTION      (0xC8)
> 
> #define USI_CON_RESET_CLEAR        (0<<0)
> #define USI_CON_RESET_SET        (1<<0)
> #define USI_CON_RESET_MASK        (1<<0)
> 
> #define USI_OPTION_HWACG_CLKREQ_ON    (1<<1)
> #define USI_OPTION_HWACG_CLKSTOP_ON    (1<<2)
> #define USI_OPTION_HWACG_MASK        (3<<1)
> 8<--------------------------------------------------------------------->8
> 
> The whole reason for those comments was missing public TRM. But in the
> end I decided it just looks ugly. Also, this way I can do RMW
> operation (discussed above) in more logical way.
> 
> Please let me know if code snippets above look good to you.

Please skip the USI_CON_RESET_CLEAR. There is no such pattern in the
code. Clearing bit is an obvious operation and such code is already
everywhere:
    val &= ~USI_CON_RESET

(or &= ~USI_RESET_MASK)

Therefore for USI_CON_RESET only:
    #define USI_CON_RESET             (1<<0)
    #define USI_CON_RESET_MASK        (1<<0)


Best regards,
Krzysztof

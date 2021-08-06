Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A1E3E2A97
	for <lists+linux-clk@lfdr.de>; Fri,  6 Aug 2021 14:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242089AbhHFMcV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 6 Aug 2021 08:32:21 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:50202
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343688AbhHFMcU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Aug 2021 08:32:20 -0400
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 0C6EB4067E
        for <linux-clk@vger.kernel.org>; Fri,  6 Aug 2021 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628253124;
        bh=YQe/91rqxclnbWHtwO35T2bNBoJfLztQell5eud2D5g=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=euIDTZg0gqQbniso2UpJoA/nlsdkkZzEZpwn8hd8KesI01a2vTeSko9RbL0RTPUBB
         5fs8iycEb/MUB+0I/TNjq61RRKZRNXC3d+WiG24xuua8qp4AubRAZ3MJ5fL6D8uNy9
         tPAIsTnlFOxr1hNVVb5Qs5WlZ64Bs+riLTHUwqzGi2YaJmHI1SM5DQim8iPAa+MhC4
         9cdmgnWNvROSB25y2OyRjUqPch/Hz00IQmWEqUsfBfZ75k3LhOYdQ/0X/ovlQWK7hv
         rdU2IRWNVC0E0nME0bY8fu2orE20QA4c1a68/er2Wu6AP3uCHGgaIrRDUvpAaoHFU/
         KD55oUpdspJqg==
Received: by mail-ej1-f69.google.com with SMTP id z20-20020a1709069454b0290595651dca8eso3080551ejx.23
        for <linux-clk@vger.kernel.org>; Fri, 06 Aug 2021 05:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YQe/91rqxclnbWHtwO35T2bNBoJfLztQell5eud2D5g=;
        b=PpbDUTY82klWR+1H82tRYD3PNSYQEngfUz0frtj99zA0h43QFg7jvsbj8l0DCrburN
         TI2csAhnRj/9aja9KYmhm2yeiYufBgm4G5fWFFyQwNc/4cyo4xHD+0oDOJdPcZHP0vYw
         bNMHGltMDQgh4JPpIC0FeHXQEg9q9uatgH4xuGYHQlPgy3PMnZ7ta4SMDbE3u1ree72D
         05setip3r3uoVKlFxaCNbuLlnvDIH0pW3QPaInHyvbGIB/miiSfRUyyKyJJYtfaWO7HV
         hKj5fTN3us02QhFtVmhdnrZPMtzmaOF+SbmLSBfZI8yF9s1JeivD1cqyQIAteJGrnERr
         Lohg==
X-Gm-Message-State: AOAM530q90Wj/x+yCgfgEwTd7MSw9/k8iCmKHibdhDAoWb0QXnaADHTp
        XFhMhLEKA5t0rIaMU1VUoBTF8YQQ+y/jEOUxwRm4qXx10chevRO3klMDa7OqXvCdPsnfO8xrHH+
        7uG6kE7sj8la/V/55Ea0hCubwZJwiN+iCBapptg==
X-Received: by 2002:a05:6402:4245:: with SMTP id g5mr1726649edb.222.1628253123595;
        Fri, 06 Aug 2021 05:32:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPTsSpDhFkB5QZHp+lNdByTmL0W66nvl/IYvdDKIE3av+cgSJZOTy0u6WCyCiMVy5KpW0G1A==
X-Received: by 2002:a05:6402:4245:: with SMTP id g5mr1726635edb.222.1628253123479;
        Fri, 06 Aug 2021 05:32:03 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id h19sm3870934edt.87.2021.08.06.05.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 05:32:03 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
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
 <20210730144922.29111-13-semen.protsenko@linaro.org>
 <455cfb5e-dff7-a5c0-3875-49abe3e900f3@canonical.com>
 <CAPLW+4nDS0atrbUFagDA0W_Ky5MvOiY+N+NQoQ+me4pndp_iWg@mail.gmail.com>
 <68734f6c-fc76-595c-8d34-8924dbbbb845@canonical.com>
 <CAPLW+4n_JKj5xeBHXONcv__vyAFvx3fhXoxJa17NTHK1RSJFJw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
Message-ID: <b753796c-2ce6-4166-7c20-289e950237ad@canonical.com>
Date:   Fri, 6 Aug 2021 14:32:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4n_JKj5xeBHXONcv__vyAFvx3fhXoxJa17NTHK1RSJFJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/08/2021 14:07, Sam Protsenko wrote:
> On Fri, 6 Aug 2021 at 10:49, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 06/08/2021 01:06, Sam Protsenko wrote:
>>> On Sat, 31 Jul 2021 at 12:03, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>
>>>>>
>>>>> This patch adds minimal SoC support. Particular board device tree files
>>>>> can include exynos850.dtsi file to get SoC related nodes, and then
>>>>> reference those nodes further as needed.
>>>>>
>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>>> ---
>>>>>  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 ++++++++++++++++++
>>>>>  arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
>>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
>>>>
>>>> Not buildable. Missing Makefile, missing DTS. Please submit with initial
>>>> DTS, otherwise no one is able to verify it even compiles.
>>>>
>>>
>>> This device is not available for purchase yet. I'll send the patch for
>>> board dts once it's announced. I can do all the testing for now, if
>>> you have any specific requests. Would it be possible for us to review
>>> and apply only SoC support for now? Will send v2 soon...
>>
>> What you propose is equal to adding a driver (C source code) without
>> ability to compile it. What's the point of having it in the kernel? It's
>> unverifiable, unbuildable and unusable.
>>
> 
> Yes, I understand. That's adding code with no users, and it's not a
> good practice.
> 
>> We can review the DTSI however merging has to be with a DTS. Usually the
>> SoC vendor adds first an evalkit (e.g. SMDK board). Maybe you have one
>> for Exynos850? Otherwise if you cannot disclose the actual board, the
>> DTSI will have to wait. You can submit drivers, though.
>>
> 
> Sure, let's go this way. I'll send v2 soon. Improving patches and
> having Reviewed-by tag for those would good enough for me at this
> point. I'll continue to prepare another Exynos850 related patches
> until the actual board is announced, like proper clock driver, reset,
> MMC, etc. Is it ok if I send those for a review too (so I can fix all
> issues ahead)?

Sure, prepare all necessary drivers earlier. I suspect clocks will be a
real pain because of significant changes modeled in vendor kernel. I
remember Paweł Chmiel (+Cc) was doing something for these:
https://github.com/PabloPL/linux/tree/exynos7420

I mentioned before - you should also modify the chipid driver. Check
also other drivers in drivers/soc/samsung, although some are needed only
for suspend&resume.

BTW, Paweł,
How is your Exynos7420 progress? :)

> And should I maybe add RFC tag for those?

No need. Drivers can be merged before DTS users.

Best regards,
Krzysztof
